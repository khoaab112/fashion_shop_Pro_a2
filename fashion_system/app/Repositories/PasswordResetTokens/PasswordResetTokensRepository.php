<?php
namespace App\Repositories\PasswordResetTokens;

use App\Repositories\BaseRepositories;
use App\Models\PasswordResetTokens;
use App\Repositories\PasswordResetTokens\PasswordResetTokensRepositoryInterface;


class PasswordResetTokensRepository extends BaseRepositories implements PasswordResetTokensRepositoryInterface{

    protected PasswordResetTokens $passwordResetTokens;
    public function __construct(PasswordResetTokens $passwordResetTokens)
    { 
        parent::__construct($passwordResetTokens);
    }
}