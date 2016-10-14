<?php
namespace frontend\models;

use yii\base\Model;
use common\models\Subscription;

/**
 * Signup form
 */
class SubscriptionForm extends Model
{
    public $email_id;
    public $subscriber_name;
    public $fitness_type;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['subscriber_name', 'required'],
            ['fitness_type', 'string'],
            ['email_id', 'trim'],
            ['email_id', 'required'],
            ['email_id', 'email'],
            ['email_id', 'string', 'max' => 255],
            ['email_id', 'unique', 'targetClass' => '\common\models\Subscription', 'message' => 'This email address has already been taken.'],
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function subscribe()
    {
        if (!$this->validate()) {
            return null;
        }
        $user = new Subscription;
        $user->email_id = $this->email_id;
        $user->fitness_type = $this->fitness_type;
        $user->subscriber_name = $this->subscriber_name;
        $user->subscription_date = date("Y-m-d H:i:s");  
        return $user->save() ? $user : null;
    }
}
