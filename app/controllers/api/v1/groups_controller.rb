class Api::V1::GroupsController < ApplicationController
  before_action :authorized: only: [:create]

end
