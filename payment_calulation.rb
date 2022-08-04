module Payment
    def calulate_payment_for_solo_user
        solo_user = User.findby(id: params[:id])
        subscription = solo_user.subscription
        plan = subscription.plan
        no_of_templates = solo_user.templates.count
        subscription_duration = subscription.start_date.month - subscription.expires_on.month
        if no_of_templates > 1
            total_payment = no_of_templates * subscription_duration * 2
        else
            total_payment = no_of_templates * subscription_duration * 2
        end
    end

    def payment_calculation
        organization = Organization.find_by(:owner_id => params[:owner_id])
        subscription = organization.subscription 
        plan = subscription.plan
        additional_cost_for_members = 0;
        members = organizations.members
        #Solo subscription
        if(plan.plan_type == 'startup') #startup subscription
            if plan.plan_frequency == "monthly"
                subscription_duration = subscription.start_date.month - subscription.expires_on.month
                total_payment = 20 * no_of_months
            elsif plan.plan_frequency == "yearly"
                subscription_duration = subscription.start_date.year - subscription.expires_on.year
                total_payment = 18 * no_of_months
            end
            if members.count > 5
                additional_users = members.count - 5
                total_payment += total_payment + (additional_users * 7)
            end
        else #enterprise subscription
            if plan.plan_frequency == "monthly"
                subscription_duration = subscription.start_date.month - subscription.expires_on.month
                total_payment = 60 * no_of_months
            elsif plan.plan_frequency == "yearly"
                subscription_duration = subscription.start_date.year - subscription.expires_on.year
                total_payment = 55 * no_of_months
            end
            if members.count > 20
                additional_users = members.count - 20
                total_payment += total_payment + (additional_users * 6)
            end
        end
    end
end