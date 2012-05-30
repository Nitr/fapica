class JuggernautObserver < ActiveRecord::Observer
  observe :log
    
  def after_create(rec)
    publish(:create, rec)
  end
  
  def after_update(rec)
    publish(:update, rec)
  end
  
  def after_destroy(rec)
    publish(:destroy, rec)
  end
  
  protected
    def publish(type, rec)
    	user = rec.user
    	user_last = Log.where('user_id = ?', user.id).order('logs.visit DESC').limit(2)[1]
      Juggernaut.publish(
        "/observer",
        { 
          type:   type, 
          id:     rec.id, 
          class:  'User', 
          record: {
 								:id => user.id,
								:email => user.email,
								:f => user.f, 
								:i => user.i, 
								:o => user.o,
								:job => user.job, 
								:photo => user.photo, 
								:visit_last => {:date => rec.visit.to_s, :type => rec.visit_type},
								:visit_penult => {:date => user_last.visit.to_s, :type => user_last.visit_type}
							} 
         },
        :except => rec.session_id
      )
    end
end
