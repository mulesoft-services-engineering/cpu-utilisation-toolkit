pipeline {

  tools {
    maven 'M3'
  }

  agent any
  environment {
    MULE_VERSION = '4.3.0'
    BG = credentials('business-group-id')
  }
  stages {

    stage('Echo Branch Name') {
      steps {
        sh 'echo Branch is $BRANCH_NAME'
      }
    }
    
    stage('Test') {
      steps {
          sh "mvn test"
      }
    }

    stage('Feature') {

      when { 
        branch "feature/*"
      }

      environment {
        APP_NAME = 'cpu-utilisation-toolkit'
        ENVIRONMENT = 'Development'
        DEPLOY_CREDS = credentials('deploy-anypoint-user')
        MULEKEY = credentials('mule-key')
        MULEENV = "dev"
        WORKERTYPE = "Micro"
        WORKERS = 1
        REGION = "eu-west-2"
      }

      steps {
            sh 'mvn -U -V -e -B -DskipTests deploy -DmuleDeploy -Dapp.runtime="$MULE_VERSION" -Dusername="$DEPLOY_CREDS_USR" -Dpassword="$DEPLOY_CREDS_PSW" -Dcloudhub.application.name="$APP_NAME" -Denvironment="$ENVIRONMENT" -DbusinessGroupId="$BG" -DworkerType="$WORKERTYPE" -Dworkers=$WORKERS -Dregion="$REGION" -Dmule.env="$MULEENV" -Dmule.key="$MULEKEY"'
      }
    }


     stage('Deploy Development') {

      when {
        branch 'develop'
      }

      environment {
        APP_NAME = 'cpu-utilisation-toolkit'
        ENVIRONMENT = 'Sandbox'
        DEPLOY_CREDS = credentials('deploy-anypoint-user')
        MULEKEY = credentials('mule-key')
        MULEENV = "dev"
        WORKERTYPE = "Micro"
        WORKERS = 1
        REGION = "eu-west-2"
      }
      
      steps {
            sh 'mvn -U -V -e -B -DskipTests deploy -DmuleDeploy -Dapp.runtime="$MULE_VERSION" -Dusername="$DEPLOY_CREDS_USR" -Dpassword="$DEPLOY_CREDS_PSW" -Dcloudhub.application.name="$APP_NAME" -Denvironment="$ENVIRONMENT" -DbusinessGroupId="$BG" -DworkerType="$WORKERTYPE" -Dworkers=$WORKERS -Dregion="$REGION" -Dmule.env="$MULEENV" -Dmule.key="$MULEKEY"'
      }
    }


  }


}
