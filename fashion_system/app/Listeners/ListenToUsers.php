<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class ListenToUsers
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    // public function handle(object $event): void
    // {
    //     //
    // }
    public function handle($event)
    {
        // Xử lý sự kiện ở đây
        // Ví dụ: Ghi log
        // \Log::info('Sự kiện được kích hoạt: ' . $event->someData);
        echo $event;
    }
}
