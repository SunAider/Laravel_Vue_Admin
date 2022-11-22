<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class HosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     * @param mixed $id
     */
    public function rules()
    {
        $rules = [
            'tag_id' => ['required','string','max:64', Rule::unique('hospitals', 'hospitals.tag_id')->whereNull('deleted_at')->ignore($this->id) ],
            'hos_name' => 'required|string|max:32',
            'postNum' => 'required|string|max:8|regex:/^[0-9]{3}-[0-9]{4}$/',
            'URLA' => 'required|max:500',
            'URLB' => 'required|max:500',
            'URLC' => 'required|max:500',
            'desp' => 'nullable|string|max:510',
        ];

        return $rules;
    }

    public function attributes()
    {
        return [
            'tag_id' => 'タグ名',
            'hos_name' => '病院名',
            'postNum' => '郵便番号',
            'URLA' => 'URL-A',
            'URLB' => 'URL-B',
            'URLC' => 'URL-C',
        ];
    }

    public function messages()
    {
        return [
            'tag_id.regex' => '32文字未満でご指定ください。',
            'hos_name.regex' => '32文字未満でご指定ください。',
            'postNum.regex' => '郵便番号は、ハイフンを含む半角数字でご指定ください（3桁-4桁）。',
            'URLA.regex' => '500文字未満でご指定ください。',
            'URLB.regex' => '500文字未満でご指定ください。',
            'URLC.regex' => '500文字未満でご指定ください。',
            'desp.regex' => '510文字未満でご指定ください。',
        ];
    }
}
