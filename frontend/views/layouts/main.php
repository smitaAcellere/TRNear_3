<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script src="https://use.typekit.net/crz3rur.js"></script>
        
<!--         <script>try{Typekit.load({ async: true });}catch(e){}</script> -->
        <script type="text/javascript">
          (function() {
            $(document).ready(function() {
              // As soon as the DOM is ready, make the example invisible
              $('h1').css('visibility', 'hidden');
            });
            try {
              Typekit.load({
                active: function() {
                  // As soon as the fonts are active, fade in the example
                  // Don't fade in browsers that don't do proper opacity, like IE
                  if (jQuery.support.opacity) {
                    console.log("test");
                    $('h1').css('visibility', 'visible').hide().fadeIn();
                  } else {
                    $('h1').css('visibility', 'visible');
                  }
                },
                inactive: function() {
                  // If the fonts are inactive, just show the example
                  // You can apply fallback styles using the wf-inactive class in your CSS
                  $('h1').css('visibility', 'visible');
                }
              })
            } catch(e) {}
          })();
        </script>



        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
    </head>
    <body>
        <?php $this->beginBody() ?>

        <div class="wrap">
            <?php
            /*
              NavBar::begin([
              'brandLabel' => 'My Company',
              'brandUrl' => Yii::$app->homeUrl,
              'options' => [
              'class' => 'navbar-inverse navbar-fixed-top',
              ],
              ]);
              $menuItems = [
              ['label' => 'Home', 'url' => ['/site/index']],
              ['label' => 'About', 'url' => ['/site/about']],
              ['label' => 'Contact', 'url' => ['/site/contact']],
              ];
              if (Yii::$app->user->isGuest) {
              $menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];
              $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
              } else {
              $menuItems[] = '<li>'
              . Html::beginForm(['/site/logout'], 'post')
              . Html::submitButton(
              'Logout (' . Yii::$app->user->identity->username . ')',
              ['class' => 'btn btn-link']
              )
              . Html::endForm()
              . '</li>';
              }
              echo Nav::widget([
              'options' => ['class' => 'navbar-nav navbar-right'],
              'items' => $menuItems,
              ]);
              NavBar::end(); */
            ?>
            <nav class="navbar">
        		  <a class="navbar-brand" href="#">
        		  	<img src="img/trnear_logo_01.svg"/>
        		  </a>
              <!--
        		  <ul class="nav navbar-nav pull-right" id="social-media-icons">
        		    <li class="nav-item active">
        		      <a class="nav-link" href="#">
        		      	<img src="img/icon-twitter.svg"/>
        		      </a>
        		    </li>
        		    <li class="nav-item">
        		      <a class="nav-link" href="#">
        		      	<img src="img/icon-instagram.svg"/>
        		      </a>
        		    </li>
        		    <li class="nav-item">
        		      <a class="nav-link" href="#">
        		      	<img src="img/icon-facebook.svg"/>
        		      </a>
        		    </li>
        		  </ul>
              -->
        		</nav>
            <div class="container">
              <main role="main">
                      <?=
                      Breadcrumbs::widget([
                          'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                      ])
                      ?>
                      <?= $content ?>
              </main>
            </div>

        </div>

        <!-- <footer class="footer">
            <div class="container">
                <p class="pull-left">&copy; My Company <?= date('Y') ?></p>
        
                <p class="pull-right"><?= Yii::powered() ?></p>
            </div>
        </footer> -->

<?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
