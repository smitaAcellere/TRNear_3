<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "subscription".
 *
 * @property integer $id
 * @property string $email_id
 * @property string $subscription_date
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
            [['email_id'], 'string', 'max' => 100],
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
        ];
    }
}
