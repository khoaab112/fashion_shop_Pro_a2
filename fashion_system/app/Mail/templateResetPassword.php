<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class templateResetPassword extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
    public $account,$token,$ip,$browser,$href ;

    public function __construct($account,$token,$ip,$browser,$href )
    {
        $this->account = $account;
        $this->token = $token;
        $this->ip = $ip;
        $this->browser = $browser;
        $this->href = $href;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Cấp lại mật khẩu',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'templates.resetPassword',
            with: [
                'email' => $this->account ,
                'token' => $this->token,
                'ip' => $this->ip,
                'browser' => $this->browser,
                'href' => $this->href,
            ],
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
