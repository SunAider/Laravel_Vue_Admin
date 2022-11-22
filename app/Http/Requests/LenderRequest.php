<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use App\Enums\RoleId;
use Illuminate\Support\Facades\Log;

class LenderRequest extends FormRequest
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
        // $test = $this->input();
        $user = $this->user;
        if (!(is_null($this->created_user_id))) {
            $rules = [
                'user.name' => 'required|string|max:32',
                'user.name_kana' => 'required|string|max:32',
                'user.email' => ['required','string','max:64', Rule::unique('users', 'users.email')->whereNull('deleted_at') ],
                'user.role_id' => 'required|integer',           
            ];
            $rules = array_merge($rules, ['user.password' => ['required', 'regex:/^(?=.*?\d)[a-zA-Z\d]([a-zA-Z0-9]){5,24}$/']]);
        } else {
            $rules = [
                'user.name' => 'required|string|max:32',
                'user.name_kana' => 'required|string|max:32',
                'user.email' => ['required','string','max:64', Rule::unique('users', 'users.email')->whereNull('deleted_at')->ignore($user['id']) ],
                'user.role_id' => 'required|integer',           
            ];
        }
        return $rules;
    }

    public function attributes()
    {
        return [
            'user.name' => '名前',
            'user.name_kana' => '名前(かな)',
            'user.email' => 'メール',
            'user.password' => 'パスワード',
            'user.role_id' => '権限',
        ];
    }

    public function messages()
    {
        return [
            'user.password.regex' => '英数字を含む6文字以上24文字未満でご指定ください。',
            'zip_code.regex' => '郵便番号は、ハイフンを含む半角数字でご指定ください（3桁-4桁）。',
            'phone.regex' => '電話番号は、半角数字、「-」(ハイフン)を含む正しい電話番号をご指定ください。',
        ];
    }
}
