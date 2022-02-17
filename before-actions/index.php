<?php

$route = get_route();

if($route == 'app/db-init') return false;

if(startWith($route,'api'))
{
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Methods: *");
    header("Content-Type: application/json");
}

// check if installation is exists
// $conn  = conn();
// $db    = new Database($conn);

// $installation = $db->single('application');
// if(!$installation && $route != "installation")
// {
//     header("location:index.php?r=installation");
//     die();
// }

$auth = auth();
if(!isset($auth->username) || (isset($auth->username) && !is_allowed_roles($route, $auth->roles)) && !startWith($route,'api'))
{
    echo "<h1>403 Unauthorized</h1>";
    die();
}

return true;