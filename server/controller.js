const { Client } = require('pg')
const client = new Client()
await client.connect()

module.exports = {
  getAllTopics: (cb) => {
    let queryString = '';
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  },
  getAllRooms: (topicId, cb) => {
    let queryString = '?';
    let queryParams = [topicId];
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  },
  getAllMessages: (roomId, cb) => {
    let queryString = '?';
    let queryParams = [roomId];
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  },
  getAllUsers: (roomId, cb) => {
    let queryString = '?';
    let queryParams = [roomId];
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  },
  postMessage: (messageData, cb) => {
    let queryString = '?';
    let queryParams = [...messageData];
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  },
  createUser: (userData, cb) => {
    let queryString = '?';
    let queryParams = [...userData];
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  },
  postFile: (fileData, cb) => {
    let queryString = '?';
    let queryParams = [...fileData];
    client.query(queryString, (err, data) => {
      if (err) {
        console.log(err);
        cb(err);
      } else {
        cb(null, data);
      }
    });
  }
}