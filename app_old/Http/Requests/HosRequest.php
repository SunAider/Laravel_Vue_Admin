<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

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
            'tag_id' => 'required|string|max:32',
            'hos_name' => 'required|string|max:32',
            'desp' => 'nullable|string|max:510',
        ];

        return $rules;
    }

    public function attributes()
    {
        return [
            'tag_id' => 'タグ名',
            'hos_name' => '病院名',
        ];
    }

    public function messages()
    {
        return [
            'tag_id.regex' => '32文字未満でご指定ください。',
            'hos_name.regex' => '32文字未満でご指定ください。',
            'desp.regex' => '510文字未満でご指定ください。',
        ];
    }
}
