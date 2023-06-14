const functions = require('firebase-functions');
const admin = require('firebase-admin');
const { Pool } = require('pg');

admin.initializeApp();

// PostgreSQLの接続情報
const pgConfig = {
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DB,
    port: process.env.POSTGRES_PORT,
    ssl: {
        rejectUnauthorized: false
      }
  };

  // Firebase Functionsのトリガー設定
exports.processSignUp = functions.auth.user().onCreate(async (user) => {
    const userId = user.uid;
    const userName = user.displayName;
    const userEmail = user.email
    const userIconPath = user.photoURL

    // PostgreSQLに接続
    const pgPool = new Pool(pgConfig);

    try {
      // PostgreSQLにデータを挿入
      const query = {
        text: 'INSERT INTO users (id, image_url, name, email) VALUES ($1, $2, $3, $4)',
        values: [userId, userIconPath,userName,userEmail],
      };
      await pgPool.query(query);
      console.log('User inserted into PostgreSQL:', userId);
    } catch (error) {
      console.error('Error inserting user into PostgreSQL:', error);
    } finally {
      // PostgreSQLの接続を解放
      pgPool.end();
    }
  });