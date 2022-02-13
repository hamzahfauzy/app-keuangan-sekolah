<?php

$conn = conn();
$db   = new Database($conn);

$data = $db->single('transactions',[
    'id' => $_GET['id']
]);

if(request() == 'POST')
{
    $db->update('transactions',$_POST['transactions'],[
        'id' => $_GET['id']
    ]);

    set_flash_msg(['success'=>'Transaksi berhasil diupdate']);
    header('location:index.php?r=transactions/index');
}

return [
    'data' => $data
];