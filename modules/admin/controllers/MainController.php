<?php


namespace app\modules\admin\controllers;


class MainController extends AppAdminController
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionTest()
    {
        return $this->render('test');
    }

}