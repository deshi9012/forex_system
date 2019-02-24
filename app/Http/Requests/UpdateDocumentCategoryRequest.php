<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;

class UpdateDocumentCategoryRequest extends FormRequest {
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {

        $documentCategoryId = Input::all()['id'];

        return [
            'name' => ['required',Rule::unique('document_categories')->ignore($documentCategoryId,'id')]
        ];
    }
}
