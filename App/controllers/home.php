<?php
use App\Core\Controller;
class home extends Controller
{
    public function index()
    {
        $this->view('home/index');
    }
}