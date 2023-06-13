<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Validation\ValidationException;

class StoreGroup extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'id'=>'',
            'owner_id'=>'required',
            'name'=>'required',
            'description'=>'required',
            'is_public'=>'required',
            'created_at'=>'',
        ];
    }

    public function messages(){
        return [
            'owner_id.required' => 'owner_id is required',
            'name.required' => 'name is required',
            'description.required' => 'description is required',
            'is_public.required' => 'is_public is required',
        ];
    }

    protected function failedValidation(\Illuminate\Contracts\Validation\Validator $validator){
        $errors = (new ValidationException($validator))->errors();
        throw new HttpResponseException(response()->json([
            'message' => 'Failed Validation',
            'errors' => $errors
        ], 422, [], JSON_UNESCAPED_UNICODE));
    }
}
