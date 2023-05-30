const AWS = require('aws-sdk');

const scheduler = new AWS.Scheduler({ apiVersion: '2021-06-30' });

module.exports.handler = (event) => {
  if (!event.message)
    throw new Error('Missing message field in event')

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
  const now = new Date()
  now.setMinutes(now.getMinutes() + 2);

  const minutes = now.getUTCMinutes() + 2;
  const hours = now.getUTCHours()
  const month = now.getUTCMonth() + 1
  const year = now.getUTCFullYear()

  return `cron(${minutes} ${hours} ${month} ? ${year} ?)`
}