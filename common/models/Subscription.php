<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "subscription".
 *
 * @property integer $id
 * @property string $email_id
 * @property string $subscription_date
 * @property string $subscriber_name
 * @property string $fitness_type
 */
class Subscription extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'subscription';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['subscription_date'], 'safe'],
            [['fitness_type'], 'string'],
            [['email_id'], 'string', 'max' => 100],
            [['subscriber_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'email_id' => Yii::t('app', 'Email ID'),
            'subscription_date' => Yii::t('app', 'Subscription Date'),
            'subscriber_name' => Yii::t('app', 'Subscriber Name'),
            'fitness_type' => Yii::t('app', 'Fitness Type'),
        ];
    }
}
