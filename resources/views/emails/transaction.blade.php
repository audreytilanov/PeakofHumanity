@component('mail::message')
Hallo {{$email}},
Untuk pengiriman tenda dari Khori Tegeh Dekorasi akan dikirim 1 hari sebelum tanggal {{ $data->tgl_pemasangan }}, dan akan dibongkar pada tanggal {{ $data->tgl_pembongkaran }} sesuai dengan detail transaksi.

@component('mail::button', ['url' => 'https://khoritegeh.balidrivetour.com/history/transaction/'.$data->id])
Lihat Detail
@endcomponent

Terimakasih,<br>
{{ config('app.name') }}
@endcomponent
