After do |scenario|
   scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_') 

   if scenario.failed?
    tirar_fotos(scenario_name.downcase! 'falhou')
   elsif
    tirar_fotos(scenario_name.downcase! 'passou')
    
    end
end