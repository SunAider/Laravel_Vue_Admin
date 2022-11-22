<?php

namespace App\Repositories;
use DB;
use App\Models\Hospital;
use App\Models\Holiday;
use App\Models\FdState;
use App\Enums\Util;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class HospitalRepository
{
    protected $model;

    public function __construct(Hospital $model)
    {
        $this->model = $model;
    }
    /**
     * 一覧取得
     *
     * @param string|null $keyword
     * @param string $sortKey
     * @param string $orderBy
     * @return object
     */
    public function fetchHospital(?string $keyword, string $sortKey, string $orderBy): object
    {
        $query = $this->model->get();
        //     ->select(
        //     );

        // // if ($keyword) {
        // //     $keywordArray = explode(',', $keyword);
        // //     $query = $query->where(function ($query) use ($keywordArray) {
        // //         foreach ($keywordArray as $word) {
        // //             if (!empty($word)) {
        // //                 $k = '%'.$word.'%';
        // //                 $query->where(function ($q) use ($k) {
        // //                     $q->orWhere('users.name', 'like', $k)
        // //                         ->orWhere('boats.boat_name', 'like', $k);
        // //                 });
        // //             }
        // //         }
        // //     });
        // // }
        return $query;
        // return $query->orderBy($sortKey, $orderBy)->paginate(Util::PAGINATE_COUNT);

    }

    /**
     * 病院 詳細情報取得
     */
    public function showWithHos($id): object
    {
        return $this->model->find($id);
    }

    /**
     * 病院 新規登録
     */
    public function storeWithHos($request)
    {        
        
        $tag_id = $request['tag_id'];
        $templateScript = Storage::disk('bb')->get('template.js');
        $scriptContents = "const tag_id='".$tag_id."';\n".$templateScript;
        if (!Storage::disk('bb')->put($tag_id.'.js', $scriptContents)) {
            return false;
        }
        Log::info("beginDate", [$request['beginDate']]);  
        if ($request['beginDate'] == null) $request['beginDate'] = date('Y-m-d 00:00:00'); 
        return $this->model->storeData(collect($request));
    }

    /**
     * 病院 更新取得
     */
    public function updateWithHos($request, $id)
    {   
        $tag_id = $request['tag_id'];
        $templateScript = Storage::disk('bb')->get('template.js');
        $scriptContents = "const tag_id='".$tag_id."';\n".$templateScript;
        if (!Storage::disk('bb')->put($tag_id.'.js', $scriptContents)) {
            return false;
        }
        // $request['URLA'] = "https://contact.fastdoctor.jp/app/home-visit?tag_id=".$tag_id;
        $origin_tag_id = $this->model->find($id);
        Log::error("origin_tag_id", [$origin_tag_id->tag_id]);

        DB::table('hosresults')->whereNull('deleted_at')->where('tag_id', $origin_tag_id->tag_id)->update(['tag_id' => $tag_id]);
        if ($request['beginDate'] == null) $request['beginDate'] = date('Y-m-d 00:00:00'); 
        return $this->model->updateData($id, collect($request));
    }

    /**
     * 病院 削除
     */
    public function destroyWithHos(int $id)
    {
        return $this->model->deleteData($id);
    }

    public function validPopup($tag_id, $click_type)
    {    
        /* 
        * if all close banner is checked
        */
        $allCloseState = DB::table('fd_states')->first('closeAll');
        if ($allCloseState->closeAll == '1') return 0;
        /* 
        *get available times from DB  
        */        
        $hos_id = DB::table('hospitals')->where('tag_id', $tag_id)->whereNull('deleted_at')->get('id');
        if (count($hos_id) == 0) return 0;
        $response = DB::table('times')->whereNull('deleted_at')->where('hos_id',  $hos_id[0]->id)->first();  
        $get_data = (array) $response;      //return $get_data; 
        if (count($get_data) == 0) return 0;
        $times = $get_data['time']; 
        $currentDate = date('Y-m-d'); 
        $currentYear = date('Y'); 
        $currentHour = date('H'); 
        $currentW = date('w'); 
        $day = 'sun';
        switch ($currentW) {
            case 0:
                $day = 'sun';
                break;
            case 1:
                $day = 'mon';
                break;
            case 2:
                $day = 'tues';
                break;
            case 3:
                $day = 'wed';
                break;
            case 4:
                $day = 'thur';
                break;
            case 5:
                $day = 'fri';
                break;
            case 6:
                $day = 'sat';
                break;
        }
        // return $currentW;
        /*
          save holidays on DB , determine whether today is holiday or not
        */
        $holidays = DB::table('holidays')->where('year', $currentYear)->get('holiday');
        if (count($holidays) == 0) {
            $holidays = HospitalRepository::getHolidays($currentYear); 
            $records = [];
            foreach ($holidays as $key => $value) {
                # code...
                $records[] = [
                    'year' => $currentYear,
                    'holiday' => $value
                ];                
            }
            DB::table('holidays')->insert($records); 
        }   
        $isHoliday = 0; 
        foreach ($holidays as $key => $value) {
            if ($currentDate == $value->holiday) {
                $isHoliday = 1; 
                break;
            }
        }
        /*
            determine whether current time belongs to Working time
        */
        $restState = 0; // 0: not popup, 1: pop up
        $time = explode(',', $times);  //return json_encode(array("currentHour" => $day)); 
        foreach ($time as $key => $value) {
            # code...           
            if ($isHoliday == 1) { 
                if ($value == ('holi'.'-'.$currentHour)) {
                    $restState = 1;  //popup should be displayed
                }
            } else {
                if ($value == ($day.'-'.$currentHour)) {
                    $restState = 1;  //popup should be displayed
                }
            }
        }      
        // return json_encode(array("restState", restState));
        /*
           PHPで郵便番号から都道府県を判定するクラス
        */
        $postNum = DB::table('hospitals')->where('tag_id', $tag_id)->whereNull('deleted_at')->first();
        if (empty($postNum)) return 0;
        $prefName = HospitalRepository::getPrefCode($postNum->postNum);
        // $prefName = '東京';   //for test

        /*
           determine whether wang is available
        */
        $wangState = 0;
        $onlineState = 0;
        $stopF = 0;

        $fdData = DB::table('fd_states')->first();
        if (empty($fdData)) return 0;
        $wang_data = json_decode($fdData->wang, true);
        $wang_data = $wang_data['areas'];
        foreach ($wang_data as $value) {
            if (str_contains($value['name'], $prefName)) {
                foreach ($value['branch_web_status'] as $subKey => $subValue) {
                    if ($subKey == 'medical_subject_web_statuses') {
                        for ($i=0; $i < count($subValue); $i++) {
                            if ($subValue[$i]['medical_subject_label'] == 'サイト' && $subValue[$i]['reception_status'] == 'enable') {
                                $wangState = 1;
                                $stopF = 1;
                                break;
                            }
                        }
                    }
                    if ($stopF == 1) break;                    
                } 
                if ($stopF == 1) break;
            }
        }
        
        /*
           determine whether online is available if wang is not available
        */
        $stopF = 0;
        if ($wangState == 0) {
            $online_data = json_decode($fdData->online, true);
            $online_data = $online_data['online'];
            foreach ($online_data as $value) {
                if ($value['web_status']['online_examination_contact_status'] == 'enable') {
                    $onlineState = 1;
                    $stopF = 1;
                    break;
                }
            }
        }

        $bannerF = 0; //return json_encode(array("restState" => $restState)); 

        if ($click_type == 1 ) 
        {
            HospitalRepository::popupClicked($tag_id, 0);
        } else {
            HospitalRepository::popupClicked($tag_id, 5);
        }

        if ($restState == 1 && $wangState == 1) {
            $bannerF = 1;
            HospitalRepository::popupClicked($tag_id, $click_type);
        }
        else if ($restState == 1 && $onlineState == 1) {
            $bannerF = 2;
            HospitalRepository::popupClicked($tag_id, $click_type);
        }
        else $bannerF = 0;
        return $bannerF;
        // return 66;
        // return json_encode(array("result" => $result));   //
    }

    public function popupClicked($tag_id, $click_type, $type = 0)
    {       
        //$click_type    pc: 1(popuped), 2(clicked)     sp: 3(popuped), 4(clicked)
        $records = [];
        $records[] = [
            'tag_id' => $tag_id,
            'click_date' => date('Y-m-d H:i:s'),
            'click_type' => $click_type,
        ];   
        $res = DB::table('hosresults')->insert($records); 

        $result_url = "";
        if ($type != 0) {
            //determine 30 days after creating script
            $redirectUrlParts = DB::table('hospitals')->where('tag_id', $tag_id)->whereNull('deleted_at')->first(['URLA', 'URLB', 'URLC', 'beginDate']);
            $diffDay = strtotime(now()) - strtotime($redirectUrlParts->beginDate);
            if ($diffDay < 2592000) {  //30 days before
                if ($type == 1) $result_url = $redirectUrlParts->URLA;
                else  $result_url = $redirectUrlParts->URLB;
                $result_url = $result_url."?tag_id=".$tag_id;
            } else {   //30 days later
                if ($redirectUrlParts->URLC=="" ) {
                    $result_url = $redirectUrlParts->URLA;
                    $result_url = $result_url."?tag_id=".$tag_id;
                } else {
                    $result_url = $redirectUrlParts->URLC;                    
                }          
            }
            return json_encode(array("url" => $result_url));
            // return json_encode(urldecode($redirectUrlParts->URLA));
        }     
           
        return "noUrl";
    }

    /* 
        *get holidays by API (ref: https://qiita.com/tksnino/items/9209a0416b28e87f8c4d)
    */    
    public function getHolidays($year) {
        $ch = curl_init();
    
        $options = array(
            CURLOPT_URL => "https://holidays-jp.github.io/api/v1/{$year}/date.json",
            CURLOPT_RETURNTRANSFER => true,
        );
    
        curl_setopt_array($ch, $options);
    
        $res = curl_exec($ch);
    
        return array_keys((array)json_decode($res));
    }
   
    /*
    * PHP CURL Funtion Template
    * Reference link: https://weichie.com/blog/curl-api-calls-with-php/
    */
   
    public function getPrefCode($zip) {
        $pref = 1;
        if (preg_match('/^(00|0[4-9])/', $zip)) {
            $pref = 1;// 北海道
        }
        elseif (preg_match('/^03/', $zip)) {
            $pref = 2;// 青森県
        }
        elseif (preg_match('/^02/', $zip)) {
            $pref = 3;// 岩手県
        }
        elseif (preg_match('/^98/', $zip)) {
            $pref = 4;// 宮城県
        }
        elseif (preg_match('/^01/', $zip)) {
            $pref = 5;// 秋田県
        }
        elseif (preg_match('/^99/', $zip)) {
            $pref = 6;// 山形県
        }
        elseif (preg_match('/^9[6-7]/', $zip)) {
            $pref = 7;// 福島県
        }
        elseif (preg_match('/^3[0-1]/', $zip)) {
            $pref = 8;// 茨城県
        }
        elseif (preg_match('/^32/', $zip)) {
            $pref = 9;// 栃木県
        }
        elseif (preg_match('/^37/', $zip)) {
            $pref = 10;// 群馬県
        }
        elseif (preg_match('/^3[3-6]/', $zip)) {
            $pref = 11;// 埼玉県
        }
        elseif (preg_match('/^2[6-9]/', $zip)) {
            $pref = 12;// 千葉県
        }
        elseif (preg_match('/^(1[0-9]|20)/', $zip)) {
            $pref = 13;// 東京都
        }
        elseif (preg_match('/^2[1-5]/', $zip)) {
            $pref = 14;// 神奈川県
        }
        elseif (preg_match('/^9[4-5]/', $zip)) {
            $pref = 15;// 新潟県
        }
        elseif (preg_match('/^93/', $zip)) {
            $pref = 16;// 富山県
        }
        elseif (preg_match('/^92/', $zip)) {
            $pref = 17;// 石川県
        }
        elseif (preg_match('/^91/', $zip)) {
            $pref = 18;// 福井県
        }
        elseif (preg_match('/^40/', $zip)) {
            $pref = 19;// 山梨県
        }
        elseif (preg_match('/^3[8-9]/', $zip)) {
            $pref = 20;// 長野県
        }
        elseif (preg_match('/^50/', $zip)) {
            $pref = 21;// 岐阜県
        }
        elseif (preg_match('/^4[1-3]/', $zip)) {
            $pref = 22;// 静岡県
        }
        elseif (preg_match('/^4[4-9]/', $zip)) {
            $pref = 23;// 愛知県
        }
        elseif (preg_match('/^51/', $zip)) {
            $pref = 24;// 三重県
        }
        elseif (preg_match('/^52/', $zip)) {
            $pref = 25;// 滋賀県
        }
        elseif (preg_match('/^6[0-2]/', $zip)) {
            $pref = 26;// 京都府
        }
        elseif (preg_match('/^5[3-9]/', $zip)) {
            $pref = 27;// 大阪府
        }
        elseif (preg_match('/^6[5-7]/', $zip)) {
            $pref = 28;// 兵庫県
        }
        elseif (preg_match('/^63/', $zip)) {
            $pref = 29;// 奈良県
        }
        elseif (preg_match('/^64/', $zip)) {
            $pref = 30;// 和歌山県
        }
        elseif (preg_match('/^68/', $zip)) {
            $pref = 31;// 鳥取県
        }
        elseif (preg_match('/^69/', $zip)) {
            $pref = 32;// 島根県
        }
        elseif (preg_match('/^7[0-1]/', $zip)) {
            $pref = 33;// 岡山県
        }
        elseif (preg_match('/^7[2-3]/', $zip)) {
            $pref = 34;// 広島県
        }
        elseif (preg_match('/^7[4-5]/', $zip)) {
            $pref = 35;// 山口県
        }
        elseif (preg_match('/^77/', $zip)) {
            $pref = 36;// 徳島県
        }
        elseif (preg_match('/^76/', $zip)) {
            $pref = 37;// 香川県
        }
        elseif (preg_match('/^79/', $zip)) {
            $pref = 38;// 愛媛県
        }
        elseif (preg_match('/^78/', $zip)) {
            $pref = 39;// 高知県
        }
        elseif (preg_match('/^8[0-3]/', $zip)) {
            $pref = 40;// 福岡県
        }
        elseif (preg_match('/^84/', $zip)) {
            $pref = 41;// 佐賀県
        }
        elseif (preg_match('/^85/', $zip)) {
            $pref = 42;// 長崎県
        }
        elseif (preg_match('/^86/', $zip)) {
            $pref = 43;// 熊本県
        }
        elseif (preg_match('/^87/', $zip)) {
            $pref = 44;// 大分県
        }
        elseif (preg_match('/^88/', $zip)) {
            $pref = 45;// 宮崎県
        }
        elseif (preg_match('/^89/', $zip)) {
            $pref = 46;// 鹿児島県
        }
        elseif (preg_match('/^90/', $zip)) {
            $pref = 47;// 沖縄県
        }
        $pref_arr = array(
            1 =>  '北海',
            2 =>  '青森',
            3 =>  '岩手',
            4 =>  '宮城',
            5 =>  '秋田',
            6 =>  '山形',
            7 =>  '福島',
            8 =>  '茨城',
            9 =>  '栃木',
            10 => '群馬',
            11 => '埼玉',
            12 => '千葉',
            13 => '東京',
            14 => '神奈川',
            15 => '新潟',
            16 => '富山',
            17 => '石川',
            18 => '福井',
            19 => '山梨',
            20 => '長野',
            21 => '岐阜',
            22 => '静岡',
            23 => '愛知',
            24 => '三重',
            25 => '滋賀',
            26 => '京都',
            27 => '大阪',
            28 => '兵庫',
            29 => '奈良',
            30 => '和歌山',
            31 => '鳥取',
            32 => '島根',
            33 => '岡山',
            34 => '広島',
            35 => '山口',
            36 => '徳島',
            37 => '香川',
            38 => '愛媛',
            39 => '高知',
            40 => '福岡',
            41 => '佐賀',
            42 => '長崎',
            43 => '熊本',
            44 => '大分',
            45 => '宮崎',
            46 => '鹿児島',
            47 => '沖縄'
        );
        // return $pref;
        Log::info("pref:", [$pref_arr[$pref]]);
        return $pref_arr[$pref];
    }

    public function getHosName($tag_id) {
        $hos_name = DB::table('hospitals')->whereNull('deleted_at')->where('tag_id', $tag_id)->first('hos_name');
        // return json_encode($hos_name);
        return $hos_name->hos_name;

    }

    public function state($tag_id) {
        $hos_name = DB::table('hospitals')->where('tag_id', $tag_id)->whereNull('deleted_at')->first('hos_name');
        return json_encode($hos_name);
    }

    public function closeAllBanner($state) {
        Log::info("state", [$state]);
        if ($state == "true") {
            $affected = DB::table('fd_states')->update(['closeAll' => 1]);

        } else {
            $affected = DB::table('fd_states')->update(['closeAll' => 0]);
        }
        return json_encode($affected);
    }
    public function getCloseAllBannerState() {
        $currState = DB::table('fd_states')->first('closeAll')->closeAll;
        Log::info("getState", [$currState]);
        return ($currState);
    }
}
