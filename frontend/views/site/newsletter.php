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
        <?php $form = ActiveForm::begin(); ?>



        <div class="form-group">
                <?=
                $form->field($model, 'email_id', [
                    'addon' => [
                        'append' => [
                            'content' => Html::submitButton('Notify Me!', ['id'=>'submit-email-button','class' => 'btn btn-lg btn-primary', 'name' => 'signup-button']),
                            'asButton' => true
                        ]
                    ]
                ])->textInput(['autofocus' => true, 'placeholder' => 'Email Address'])->label(false)
                ?>
        </div>

<?php ActiveForm::end(); ?>
    </div>
</div>