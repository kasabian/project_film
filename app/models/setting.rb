# encoding: utf-8
class Setting < ActiveRecord::Base
  attr_accessible :count_page, :site_name, :tegs
  validates :count_page, :numericality => { :only_integer => true, :message => "только числовые значения" }  
end