<?php
/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

use yii\helpers\Html;
use kartik\form\ActiveForm;

$this->title = 'TRNear - Coming Soon';
//$this->params['breadcrumbs'][] = $this->title;
?>
<!-- blue box -->
<div class="centered-container">
    <div class="bkgd-container"></div>
    <div class="content-container" id="cta-block">
        <h1 id="fittext-01">TRNear—<br>Making personal fitness easier.</h1>
        <hr>
        <p>Are you a personal trainer looking to grow your business?<br>Sign up now to get early access and stay notified on our development!</p>
        <?php if (Yii::$app->session->hasFlash('success')) { ?>
            <div class="alert-success alert fade in" id="w1-success-0">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>

                <?= Yii::$app->session->getFlash('success') ?>

            </div>

        <?php } ?>

        <?php $form = ActiveForm::begin(['validateOnChange'=> 0,'validateOnBlur'=>0]); ?>

        <div class="form-group">
            <?= $form->field($model, 'subscriber_name')->textInput(['autofocus' => true, 'placeholder' => 'Full Name'])->label(false) ?>

            <?= $form->field($model, 'email_id')->textInput(['placeholder' => 'Email Address'])->label(false) ?>

            <?= $form->field($model, 'fitness_type')->textInput(['placeholder' => 'Fitness Type (Optional)'])->label(false) ?>

            <?= Html::submitButton('Notify me!', ['id'=>'submit-email-button','class' => 'btn btn-primary btn-lg form-control', 'name' => 'signup-button']); ?>
        </div>

        <?php ActiveForm::end(); ?>
    </div>
</div>