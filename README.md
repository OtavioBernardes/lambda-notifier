<h1 align="center">
   Dev-Pay - API
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
   <picture>
      <source media="(prefers-color-scheme: light)" srcset="https://miro.medium.com/max/1400/1*0R0r00uF1RyRFxkxo3HVDg.png" />
      <img>
   </picture>
</p>

## :question: About
The lambda-notifier is a project that uses AWS resources to subscribe to a newsletter and schedule the sending of emails.

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
5 - Access to your AWS console and verify in API gateway our api endpoint.
6 - Create a subscription in POST -> `/subscription`.
7 - Confirm your subscription in your email
7 - Scheduler a new email in POST -> `/scheduling/`
8 - Await the time and verify your email


**Free Software, Hell Yeah!**
