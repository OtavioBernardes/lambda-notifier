const AWS = require('aws-sdk');

const scheduler = new AWS.Scheduler({ apiVersion: '2021-06-30' });

module.exports.handler = (event) => {
  if (!event.message)
    throw new Error('Missing event message')

  const rule = `new-message-${new Date().getTime()}`
  const target = {
    RoleArn: process.env.TARGET_ROLE,
    Arn: process.env.SNS_TOPIC_ARN,
    Input: JSON.stringify({
      message: event.message
    }),
  };

  const params = {
    Description: rule,
    FlexibleTimeWindow: {
      Mode: 'OFF',
    },
    Name: rule,
    ScheduleExpression: mountScheduleExpression(),
    State: 'ENABLED',
    Target: target,
  };

  scheduler.createSchedule(params, function (error, data) {
    if (error) {
      console.log('createSchedule: Error ', { error: JSON.stringify(error) });
      throw error;
    } else {
      console.log(`createSchedule: Success. Data: ${JSON.stringify(data)}`);
    }
  });

  return { statusCode: 200 }
}

const mountScheduleExpression = () => {
  const minutes = new Date().getUTCMinutes() + 2;

  return `cron(${minutes} * * * ? *)`
}