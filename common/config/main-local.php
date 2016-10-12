<?php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'driverName' => 'pgsql',
            'dsn' => 'pgsql:host=localhost;port=5432;dbname=trnear',
            'username' => 'trnear',
            'password' => 'trnear',
            'charset' => 'utf8',
            'schemaMap' => [
            'pgsql'=> [
              'class'=>'yii\db\pgsql\Schema',
                'defaultSchema' => 'public' //specify your schema here
            ]
          ], // PostgreSQL
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
    ],
];
