using './main.bicep' /*TODO: Provide a path to a bicep template*/

param storageAccountNameParam = 'devbicepseriessa'

param tagsParam = {
  owner: 'nacho'
  environemnt: 'development'
  team: 'azure-support-community'
}