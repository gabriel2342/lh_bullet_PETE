
Organization
    1) rails g model Organization team:references name:string

    2) bin/super-scaffold crud Organization Team name:text_field

    3) rake db:migrate


Municipality
    4) rails g model Municipality organization:references name:string url:string

    5) bin/super-scaffold crud Municipality Organization,Team name:text_field url:text_field

    6) rake db:migrate

ServiceProvider
    7) rails g model ServiceProvider name:string about:text street:string city:string state:string zip:string contact_person:string phone:string email:string url:string services:string municipality:references
           
    8) bin/super-scaffold crud ServiceProvider Municipality,Organization,Team name:text_field about:text_area street:text_field city:text_field state:text_field zip:text_field contact_person:text_field phone:phone_field email:email_field url:text_field services:buttons

    9) text for buttons, add at config/locales/en/service_providers.en.yml, provided default for buttons is one: One, two: Two, three: Three
        long_term_housing: Long Term Housing
        immediate_housing: Immediate Housing
        finding_food: Finding Food
        family_services: Family Services
        mental_health: Mental Health Services
        substance_use: Substance Use
        immigration: Immigration
        prisoner_reentry: Prisoner Re-entry
        domestic_violence: Domestic Violence
        military: Former or Current U.S. military?

    9) rake db:migrate

       
Hour
rails g model Hour municipality:references name:string

bin/super-scaffold crud Hour Municipality,Organization,Team name:text_field 


ProviderHour
rails g model ProviderHour service_provider:references hour:references 


bin/super-scaffold join-model ProviderHour service_provider_id{class_name=ServiceProvider} hour_id{class_name=Hour }


bin/super-scaffold crud-field ServiceProvider hour_ids:super_select{class_name=ServiceProviders:Hour} 

rake db:migrate

in app/models/project.rb add
    def valid_hours
        team.service_provider_hours
    end


Service
rails g model ServiceProvider::Service municipality:references name:string
bin/super-scaffold crud ServiceProvider:Service name:text_field

ServiceProviderService
rails g model ServiceProvider::ServiceProviderService service_provider:references service:references


bin/super-scaffold join-model ServiceProvider::ServiceProviderService service_provider_id{class_name=ServiceProvider} service_id{class_name=ServiceProvider::Service }

bin/super-scaffold crud-field ServiceProvider service_ids:super_select{class_name=ServiceProvider::Service}

in app/models/project.rb add
    def valid_services
        team.service_provider_services
    end








Hotline
rails g model hotline hotline:string
belongs_to :municipality

Support_Groups???


ResourceGuide
rails g model resource_guide team:references  municiplaity:references name:string
has_many :service_providers
has_many :hotlines