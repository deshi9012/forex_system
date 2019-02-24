<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;

class UpdateUserRequest extends FormRequest {
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

        $userId = Input::all()['id'];

        $rules = [
            'title'                     => 'required|string|max:20',
            'first_name'                => 'required|string|min:3',
            'last_name'                 => 'required|string|min:3',
            'position_id'               => 'required',
            'timezone_id'               => 'required',
            'work_week'                 => ['required',Rule::in(['Mon-Fri','Sun-Thu'])],
            'username'                  => ['required','min:3','max:20',Rule::unique('users')->ignore($userId,'id')],
            'superior_id'               => 'required|numeric',
            'phone_personal'            => 'required|string',
            'phone_office'              => 'required|string',
            'email'                => ['required','email',Rule::unique('users','email_personal')->ignore($userId,'id'),Rule::unique('users','email')->ignore($userId,'id')],
            'email_personal'            => ['required','email',Rule::unique('users','email_personal')->ignore($userId,'id'),Rule::unique('users','email')->ignore($userId,'id')],
            'selected_roles'            => 'required',
            'salary'                    => 'required|numeric'
        ];

        if(Input::get('change_pass') == true){
            $rules['password'] = 'required|confirmed';
            $rules['password_confirmation'] = 'required';
        }

        return $rules;
    }
}
