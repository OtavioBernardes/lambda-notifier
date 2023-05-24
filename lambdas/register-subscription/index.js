const AWS = require('aws-sdk');

const sns = new AWS.SNS({ apiVersion: '2010-03-31' })

module.exports.handler = async (event) => {
  if (!event.email)
    throw new Error('Missing email')

  const params = {
    Protocol: 'email',
    TopicArn: process.env.SNS_TOPIC_ARN,
    Endpoint: event.email
  }

  await sns.subscribe(params, function (err, data) {
    if (err) {
      console.log('failed to subscribe', err);
    } else {
      console.log('success to subscribe', data)
    }
  }).promise()

  return { statusCode: 200 }
}