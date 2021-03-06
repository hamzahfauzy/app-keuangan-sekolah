<?php

$datas = [];

if(
    isset($_GET['from']) && !empty($_GET['from']) &&
    isset($_GET['to']) && !empty($_GET['to'])
)
{
    $conn = conn();
    $db   = new Database($conn);

    $db->query = "SELECT 
                    bills.*, 
                    subjects.name as subject_name, 
                    subjects.special_id, 
                    accounts.name as account_name,
                    (SELECT sum(transactions.amount) FROM transactions WHERE transactions.bill_id = bills.id) as total_bayar
                FROM 
                    bills 
                JOIN subjects ON subjects.id = bills.subject_id 
                JOIN accounts ON accounts.id = bills.account_id
                WHERE 
                bills.created_at BETWEEN '$_GET[from] 00:00:00' AND '$_GET[to] 23:59:59'
                ";
    $datas = $db->exec('all');
}

return compact('datas');