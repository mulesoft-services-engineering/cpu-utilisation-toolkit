pipeline {

  agent any
  environment {
    //adding a comment for the commit test
    DEPLOY_CREDS = credentials('deploy-anypoint-user')
    MULEKEY = credentials('mule-key')
    MULE_VERSION = '4.3.0'
    BG = "e64dda65-f623-431f-a191-99de041bb818"
    MULEENV = "Development"
    WORKERTYPE = "Micro"
    WORKERS = "1"
    REGION = "region=eu-west-2"
  }
  stages {
    stage('Build') {
      steps {
            sh 'mvn -B -U -e -V clean -DskipTests package'
      }
    }

    stage('Test') {
      steps {
          sh "mvn test"
      }
    }

     stage('Deploy Development') {
      environment {
        ENVIRONMENT = 'Development'
        APP_NAME = 'vCore'
      }
      steps {
            sh 'mvn -U -V -e -B -DskipTests deploy -DmuleDeploy -Dapp.runtime="%MULE_VERSION%" -Dusername="%DEPLOY_CREDS_USR%" -Dpassword="%DEPLOY_CREDS_PSW%" -Dcloudhub.application.name="%APP_NAME%" -Denvironment="%ENVIRONMENT%" -DbusinessGroupId="%BG%" -DworkerType="%WORKERTYPE%" -Dworkers="%WORKERS%" -Dregion="%REGION%" -Dmule.env="%MULEENV%" -Dmule.key="%MULEKEY%"'
      }
    }


  }


}