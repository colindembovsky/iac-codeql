#!/bin/bash
# names must match the names in providers.tf
RG_NAME="cd-mindaro-shared"
SA_NAME="cdminshared"
CONTAINER_NAME="tfstate"

# create a resource group
az group create -n $RG_NAME -l southcentralus

# create a storage account for storing terraform state
az storage account create -n $SA_NAME -g $RG_NAME -l southcentralus --sku Standard_LRS

KEY=$(az storage account keys list -g $RG_NAME -n $SA_NAME --query "[0].value" -o tsv)

az storage container create -n $CONTAINER_NAME --account-name $SA_NAME --account-key $KEY

