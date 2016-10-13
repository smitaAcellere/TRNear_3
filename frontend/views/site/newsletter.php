<?php
/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

use yii\helpers\Html;
use kartik\form\ActiveForm;

$this->title = 'Subscribe';
//$this->params['breadcrumbs'][] = $this->title;
?>
<!-- blue box -->
<div class="centered-container">
    <div class="bkgd-container"></div>
    <div class="content-container" id="cta-block">
        <h1>Large Headline Here</h1>
        <hr>
        <p>Vestibulum rutrum quam vitae fringilla tincidunt. Suspendisse nec tortor urna. Ut laoreet sodales nisi, quis iaculis nulla iaculis vitae. Donec sagittis faucibus lacus eget blandit..</p>
        <?php if (Yii::$app->session->hasFlash('success')) { ?>
            <div class="alert-success alert fade in" id="w1-success-0">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>

                <?= Yii::$app->session->getFlash('success') ?>

            </div>

        <?php } ?>

        <?php $form = ActiveForm::begin(); ?>

        <div class="form-group">
            <?=
            $form->field($model, 'email_id', [
                'addon' => [
                    'append' => [
                        'content' => Html::submitButton('Notify Me!', ['id' => 'submit-email-button', 'class' => 'btn btn-lg btn-primary', 'name' => 'signup-button']),
                        'asButton' => true
                    ]
                ]
            ])->textInput(['autofocus' => true, 'placeholder' => 'Email Address'])->label(false)
            ?>
        </div>

        <?php ActiveForm::end(); ?>
    </div>
</div>