class HomeController < ApplicationController
  
  def index
    
    require 'date'
    
    # 현재 "nowDate"에 저장합니다.
    nowDate = Time.now
    
    # 아래에 시간을 설정해 주세요
    setDate = Time.new(2018,5,15,00,05,6)
    @returnValue = 0

    if nowDate.year == setDate.year && nowDate.month >= setDate.month && nowDate.day >= setDate.day 
      @returnValue = 1
    end
    
    @meetings = Meeting.all
    @Timer = Date
    @i = 0
    @j = 1
    
    all_activity = ['어벤져스 인피티니 워를 보러간다', '한강 공원에 피크닉을 간다', '맛집 탐방을 간다', '북한산 등산을 간다', '노량진 수산시장에 간다', '야구를 보러 간다', '이태원 펍에 술 마시러 간다'].to_a
    @activity = all_activity.sample(1).to_s
  end
  
  def see_meeting
    @meetings = Meeting.all
    @i = 1
    @j = 0
  end
  
  
  
  def meeting_sign_up
    
    meetings = Meeting.new
    meetings.name = params[:name]
    meetings.school = params[:school]
    meetings.save
    
    redirect_to '/'
    
  end
  
  def album
  end
  
  
end
