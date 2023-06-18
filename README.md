<h1 align="center">
   Lambda Notifier
</h1>

<p align="center">
  <img alt="Last commit on GitHub" src="https://img.shields.io/github/last-commit/OtavioBernardes/lambdas-notifier?color=7D40E7">
  <img alt="Made by Rocketseat" src="https://img.shields.io/badge/made%20by-OtavioBernardes-%20?color=7D40E7">
  <img alt="Project top programing language" src="https://img.shields.io/github/languages/top/OtavioBernardes/lambdas-notifier?color=7D40E7">
  <img alt="Repository size" src="https://img.shields.io/github/repo-size/OtavioBernardes/lambdas-notifier?color=7D40E7">
</p>

<p align="center">
  <a href="#question-about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#gear-technologies">Technologies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#rocket-getting-started">Getting Started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#page_facing_up-license">License</a>&nbsp;&nbsp;&nbsp;
</p>

# Project Overview:


<p align="center">
      <img src="https://raw.githubusercontent.com/OtavioBernardes/lambda-notifier/main/public/arch_draw.png">
</p>

## :question: About
The Lambda-Notifier project utilizes AWS resources to provide a comprehensive solution for newsletter subscription and automated email notifications. It comprises two lambdas integrated with an API Gateway. One route enables users to register for the newsletter, while the other route allows scheduling the dispatch of messages to all subscribers of the newsletter.

## :gear: Technologies

**These are the technologies that I used to develop this application:**</br> 
⌨️ <strong>Javascript</strong> —> JavaScript</br> 
⚙️ <strong>AWS</strong> —> Amazom Web Services</br>
⚙️ <strong>Terraform</strong> —> Infrastructure as code</br>

## :rocket: Getting Started

1. Clone this repo: `git clone https://github.com/OtavioBernardes/lambdas-notifier`
2. Move to the directory: `cd lambdas-notifier/terraform`
3. Configure your AWS CLI with your credentials: `AWS configure`
4. Run the following command to create a infrastructure in your AWS workpace: `terraform apply --var-file=config/dev.tfvars --auto-approve`
5. Access to your AWS console and verify in API gateway our api endpoint.
6. Create a subscription in POST -> `/subscription`:
  ```
  {
    "email": "test@example.com"
  }
  ```
7. Confirm your subscription in your email
8. Scheduler a new email in POST -> `/schedule`: 
  ```
  {
    "message": "testing schedule",
    "minutesOffset": "5"
  }
  ```

9. Await the time and verify your email

#### Scheduler route fields

| field | required | description | default | condition|
| ----- | ----- | ----- | ----- | ----- |
| minutesOffset | false | time in minutes to be added to the momment | 2 | >=2 |
| message | true | message to send in email | - | - |
