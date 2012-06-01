class Company extends Spine.Model
  @configure "api/company_name", "name"
  @extend Spine.Model.Ajax

window.Company = Company