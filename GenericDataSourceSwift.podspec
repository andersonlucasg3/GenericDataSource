Pod::Spec.new do |s|
  s.name         = "GenericDataSourceSwift"
  s.version      = "0.1.1"
  s.summary      = "A generic datasource for UITableView or UICollectionView."
  s.homepage     = "https://github.com/andersonlucasg3/GenericDataSource"
  s.license      = { :type => "MIT" }
  s.authors      = { "Anderson Lucas C. Ramos" => "anderson@insanitech.com.br", "Jorge Luis Xavier dos Santos" => "mr.jorge.xavier@gmail.com" }
  s.source       = { :git => "https://github.com/andersonlucasg3/GenericDataSource.git", :tag => "#{s.version}" }

  s.source_files = "GenericDataSource/**/*.swift"
  
  s.swift_version = "4.0"

  s.ios.deployment_target = "9.0"
  s.tvos.deployment_target = "9.0"
end
