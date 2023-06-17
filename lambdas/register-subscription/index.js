const AWS = require('aws-sdk');

const sns = new AWS.SNS({ apiVersion: '2010-03-31' });

module.exports.handler = async (event) => {
  const body = JSON.parse(event.body);

  if (!body.email) {
    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'Email is missing' }),
    };
  }

  const params = {
    Protocol: 'email',
    TopicArn: process.env.SNS_TOPIC_ARN,
    Endpoint: body.email,
  };

  try {
    await sns.subscribe(params).promise();
    return {
      statusCode: 201,
      body: JSON.stringify({ message: "Success: Created subscription" }),
    };
  } catch (err) {
    console.log('Failed to subscribe', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err }),
    };
  }
};