<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;

class StoreUserRequest extends FormRequest {
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

        return [
            'title'                     => 'required|string|max:20',
            'first_name'                => 'required|string|min:3',
            'last_name'                 => 'required|string|min:3',
            'position_id'               => 'required',
            'timezone_id'               => 'required',
            'work_week'                 => ['required',Rule::in(['Mon-Fri','Sun-Thu'])],
            'username'                  => 'required|min:3|max:20|unique:users',
            'password'                  => 'required|confirmed',
            'password_confirmation'     => 'required',
            'superior_id'               => 'required|numeric',
            'phone_personal'            => 'required|string',
            'phone_office'              => 'required|string',
            'email'                => 'required|email|unique:users,email_personal|unique:users,email',
            'email_personal'            => 'required|email|unique:users,email_personal|unique:users,email',
            'selected_roles'            => 'required',
            'salary'                    => 'required|numeric'
        ];

    }
}
