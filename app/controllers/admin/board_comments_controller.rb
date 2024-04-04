class Admin::BoardCommentsController < ApplicationController
before_action :authenticate_admin!
end