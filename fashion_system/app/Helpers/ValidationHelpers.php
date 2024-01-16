<?php

namespace App\Helpers;

class validationHelpers
{
    public static function validation($data,$validationRules,$attributeNames)
    {
        //parameter gồm dữ liệu đầu vào, điều kiện validation , tên của mỗi trường
        $customMessages = [
            'required' => ':attribute không được bỏ trống.',
            'min' => ':attribute phải có ít nhất :min ký tự.',
            'max' => ':attribute chỉ tối đa :max ký tự.',
            'same' => ':attribute không khớp với mật khẩu đã nhập.',
            'filled' => ':attribute chưa được gửi.',
            'string' => ':attribute không thực sự là một chuỗi kí tự hợp lệ.',
            'numeric' => ':attribute không thực sự là số kí tự hợp lệ.',
            'integer' => ':attribute không thực sự là số nguyên kí tự hợp lệ.',
            'email' => ':attribute không đúng định dạng email.',
            'date' => ':attribute không đúng định dạng ngày tháng.',
            'url' => ':attribute không đúng định url.',
            'confirmed' => ':attribute không khớp với giá trị cần xác nhận.',
            'unique' => ':attribute đã được sử dụng',
            'exists' => ':attribute không tồn tại',
            'mimes' => ':attribute file không đúng định dạng',
            'regex' => ':attribute không đúng định dạng',
            // 'unique' => ':attribute đã được sử dụng',
            //còn thiếu vài trường nữa , nhưng cảm thấy không cần thiết
        ];
        return validator()->make($data, $validationRules, $customMessages, $attributeNames);
    }
    public static function checkEmailFormat(){

    }
    public static function checkPhoneNumberFormat()
    {

    }
    public static function checkStrangeCharacters($string)
    {
        $pattern = '/[^\p{L}\p{N}\s]/u';
        if (preg_match($pattern, $string)) {
            return true;
        } else {
            return false;
        }
    }
}
