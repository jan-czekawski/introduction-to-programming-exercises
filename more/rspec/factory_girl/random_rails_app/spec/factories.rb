FactoryGirl.define do

  factory :secret_service_agent do
    name "Q"
    favorite_gadget "Submarine Lotus Espirit"
    skills "Inventing gizmos and hacking"
  end
  
  factory :spy do
    name "Mary McSpy"
    favorite_gadget "Hoverboard"
    skills "Timetravelling"
  end
  
  # attributes_for(:spy) returns:
  # { name: "Marty McSpy", favorite_gadget: "Hoverboard", skills: "Timetravelling" }
  
  # create(:spy) rets:
  # < Spy id: 1, name: "Marty McSpy", favorite_gadget: "Hoverboard", skills: "Timetravelling",
  # created_at: "2017-10-08 21:46:01", updated_at: "2017-10-08 21:46:01" >
  
  # build(:spy) rets:
  # < Spy id: nil, name: "Marty McSpy", favorite_gadget: "Hoverboard", skills: "Timetravelling",
  # created_at: nil, updated_at: nil >
  
  # build_stubbed(:spy) rets:
  # < Spy id: 1001, name: "Marty McSpy", favorite_gadget: "Hoverboard", skills: "Timetravelling",
  # created_at: nil, updated_at: nil >
   
end