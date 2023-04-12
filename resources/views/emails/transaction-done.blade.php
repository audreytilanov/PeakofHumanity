@component('mail::message')
Hallo {{$email}},
Untuk pengiriman tenda dari Khori Tegeh Dekorasi telah selesai, terimakasih telah menggunakan jasa Khori tegeh Dekorasi :D. Mohon review dan berikan tanggapan mengenai produk kami. Thanks a lot!

@component('mail::button', ['url' => 'https://khoritegeh.balidrivetour.com/history/transaction/'.$data->id])
Beri Review
@endcomponent

Terimakasih,<br>
{{ config('app.name') }}
@endcomponent
