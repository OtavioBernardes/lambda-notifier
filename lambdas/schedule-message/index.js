const AWS = require('aws-sdk');

const scheduler = new AWS.Scheduler({ apiVersion: '2021-06-30' });
const minTimeScheduler = 2

module.exports.handler = (event) => {
  const body = JSON.parse(event.body);
  const minutesOffset = body.minutesOffset >= minTimeScheduler ? body.minutesOffset : minTimeScheduler;

  if (!body.message) {
    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'message is missing' }),
    };
  }

  const rule = `schedule-new-message-${new Date().getTime()}`;
  const target = {
    RoleArn: process.env.TARGET_ROLE,
    Arn: process.env.SNS_TOPIC_ARN,
    Input: JSON.stringify({
      message: body.message,
    }),
  };

  const params = {
    Description: rule,
    FlexibleTimeWindow: {
      Mode: 'OFF',
    },
    Name: rule,
    ScheduleExpression: mountScheduleExpression(minutesOffset),
    State: 'ENABLED',
    Target: target,
  };

  scheduler.createSchedule(params, function (error, data) {
    if (error) {
      console.log('createSchedule: Error', { error: JSON.stringify(error) });
      throw error;
    } else {
      console.log(`createSchedule: Success. Data: ${JSON.stringify(data)}`);
    }
  });

  return {
    statusCode: 201,
    body: JSON.stringify({ message: 'success: schedule created' }),
  };
};

const mountScheduleExpression = (minutesOffset) => {
  const now = new Date();
  now.setMinutes(now.getMinutes() + minutesOffset);

  const minutes = now.getUTCMinutes().toString().padStart(2, '0');
  const hours = now.getUTCHours().toString().padStart(2, '0');
  const month = now.getUTCMonth() + 1;
  const year = now.getUTCFullYear();

  return `cron(${minutes} ${hours} ${month} ? ${year} ?)`;
};

