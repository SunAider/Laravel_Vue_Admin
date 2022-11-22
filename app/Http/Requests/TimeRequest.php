<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class TimeRequest extends FormRequest
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
            'hos_id' => 'required','integer','max:32',
            'time' => 'required|string|',
        ];

        return $rules;
    }

    public function attributes()
    {
        return [
            'hos_id' => 'タグ名',
            'time'=>'時間帯',
        ];
    }
}
