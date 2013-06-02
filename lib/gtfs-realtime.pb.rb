##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'

module Transit_Realtime

  ##
  # Message Classes
  #
  class FeedMessage < ::Protobuf::Message; end
  class FeedHeader < ::Protobuf::Message
    class Incrementality < ::Protobuf::Enum
      define :FULL_DATASET, 0
      define :DIFFERENTIAL, 1
    end
    
  end
  class FeedEntity < ::Protobuf::Message; end
  class TripUpdate < ::Protobuf::Message
    class StopTimeEvent < ::Protobuf::Message; end
    class StopTimeUpdate < ::Protobuf::Message
      class ScheduleRelationship < ::Protobuf::Enum
        define :SCHEDULED, 0
        define :SKIPPED, 1
        define :NO_DATA, 2
      end
      
    end
  end
  class VehiclePosition < ::Protobuf::Message
    class VehicleStopStatus < ::Protobuf::Enum
      define :INCOMING_AT, 0
      define :STOPPED_AT, 1
      define :IN_TRANSIT_TO, 2
    end
    
    class CongestionLevel < ::Protobuf::Enum
      define :UNKNOWN_CONGESTION_LEVEL, 0
      define :RUNNING_SMOOTHLY, 1
      define :STOP_AND_GO, 2
      define :CONGESTION, 3
      define :SEVERE_CONGESTION, 4
    end
    
  end
  class Alert < ::Protobuf::Message
    class Cause < ::Protobuf::Enum
      define :UNKNOWN_CAUSE, 1
      define :OTHER_CAUSE, 2
      define :TECHNICAL_PROBLEM, 3
      define :STRIKE, 4
      define :DEMONSTRATION, 5
      define :ACCIDENT, 6
      define :HOLIDAY, 7
      define :WEATHER, 8
      define :MAINTENANCE, 9
      define :CONSTRUCTION, 10
      define :POLICE_ACTIVITY, 11
      define :MEDICAL_EMERGENCY, 12
    end
    
    class Effect < ::Protobuf::Enum
      define :NO_SERVICE, 1
      define :REDUCED_SERVICE, 2
      define :SIGNIFICANT_DELAYS, 3
      define :DETOUR, 4
      define :ADDITIONAL_SERVICE, 5
      define :MODIFIED_SERVICE, 6
      define :OTHER_EFFECT, 7
      define :UNKNOWN_EFFECT, 8
      define :STOP_MOVED, 9
    end
    
  end
  class TimeRange < ::Protobuf::Message; end
  class Position < ::Protobuf::Message; end
  class TripDescriptor < ::Protobuf::Message
    class ScheduleRelationship < ::Protobuf::Enum
      define :SCHEDULED, 0
      define :ADDED, 1
      define :UNSCHEDULED, 2
      define :CANCELED, 3
      define :REPLACEMENT, 5
    end
    
  end
  class VehicleDescriptor < ::Protobuf::Message; end
  class EntitySelector < ::Protobuf::Message; end
  class TranslatedString < ::Protobuf::Message
    class Translation < ::Protobuf::Message; end
  end
  
  ##
  # Message Fields
  #
  class FeedMessage
    required ::Transit_Realtime::FeedHeader, :header, 1
    repeated ::Transit_Realtime::FeedEntity, :entity, 2
  end
  
  class FeedHeader
    required ::Protobuf::Field::StringField, :gtfs_realtime_version, 1
    optional ::Transit_Realtime::FeedHeader::Incrementality, :incrementality, 2, :default => ::Transit_Realtime::FeedHeader::Incrementality::FULL_DATASET
    optional ::Protobuf::Field::Uint64Field, :timestamp, 3
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class FeedEntity
    required ::Protobuf::Field::StringField, :id, 1
    optional ::Protobuf::Field::BoolField, :is_deleted, 2, :default => false
    optional ::Transit_Realtime::TripUpdate, :trip_update, 3
    optional ::Transit_Realtime::VehiclePosition, :vehicle, 4
    optional ::Transit_Realtime::Alert, :alert, 5
  end
  
  class TripUpdate
    class StopTimeEvent
      optional ::Protobuf::Field::Int32Field, :delay, 1
      optional ::Protobuf::Field::Int64Field, :time, 2
      optional ::Protobuf::Field::Int32Field, :uncertainty, 3
      
      # Extension Fields
      extensions 1000...2000
    end
    
    class StopTimeUpdate
      optional ::Protobuf::Field::Uint32Field, :stop_sequence, 1
      optional ::Protobuf::Field::StringField, :stop_id, 4
      optional ::Transit_Realtime::TripUpdate::StopTimeEvent, :arrival, 2
      optional ::Transit_Realtime::TripUpdate::StopTimeEvent, :departure, 3
      optional ::Transit_Realtime::TripUpdate::StopTimeUpdate::ScheduleRelationship, :schedule_relationship, 5, :default => ::Transit_Realtime::TripUpdate::StopTimeUpdate::ScheduleRelationship::SCHEDULED
      
      # Extension Fields
      extensions 1000...2000
    end
    
    required ::Transit_Realtime::TripDescriptor, :trip, 1
    optional ::Transit_Realtime::VehicleDescriptor, :vehicle, 3
    repeated ::Transit_Realtime::TripUpdate::StopTimeUpdate, :stop_time_update, 2
    optional ::Protobuf::Field::Uint64Field, :timestamp, 4
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class VehiclePosition
    optional ::Transit_Realtime::TripDescriptor, :trip, 1
    optional ::Transit_Realtime::VehicleDescriptor, :vehicle, 8
    optional ::Transit_Realtime::Position, :position, 2
    optional ::Protobuf::Field::Uint32Field, :current_stop_sequence, 3
    optional ::Protobuf::Field::StringField, :stop_id, 7
    optional ::Transit_Realtime::VehiclePosition::VehicleStopStatus, :current_status, 4, :default => ::Transit_Realtime::VehiclePosition::VehicleStopStatus::IN_TRANSIT_TO
    optional ::Protobuf::Field::Uint64Field, :timestamp, 5
    optional ::Transit_Realtime::VehiclePosition::CongestionLevel, :congestion_level, 6
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class Alert
    repeated ::Transit_Realtime::TimeRange, :active_period, 1
    repeated ::Transit_Realtime::EntitySelector, :informed_entity, 5
    optional ::Transit_Realtime::Alert::Cause, :cause, 6, :default => ::Transit_Realtime::Alert::Cause::UNKNOWN_CAUSE
    optional ::Transit_Realtime::Alert::Effect, :effect, 7, :default => ::Transit_Realtime::Alert::Effect::UNKNOWN_EFFECT
    optional ::Transit_Realtime::TranslatedString, :url, 8
    optional ::Transit_Realtime::TranslatedString, :header_text, 10
    optional ::Transit_Realtime::TranslatedString, :description_text, 11
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class TimeRange
    optional ::Protobuf::Field::Uint64Field, :start, 1
    optional ::Protobuf::Field::Uint64Field, :end, 2
  end
  
  class Position
    required ::Protobuf::Field::FloatField, :latitude, 1
    required ::Protobuf::Field::FloatField, :longitude, 2
    optional ::Protobuf::Field::FloatField, :bearing, 3
    optional ::Protobuf::Field::DoubleField, :odometer, 4
    optional ::Protobuf::Field::FloatField, :speed, 5
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class TripDescriptor
    optional ::Protobuf::Field::StringField, :trip_id, 1
    optional ::Protobuf::Field::StringField, :route_id, 5
    optional ::Protobuf::Field::StringField, :start_time, 2
    optional ::Protobuf::Field::StringField, :start_date, 3
    optional ::Transit_Realtime::TripDescriptor::ScheduleRelationship, :schedule_relationship, 4
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class VehicleDescriptor
    optional ::Protobuf::Field::StringField, :id, 1
    optional ::Protobuf::Field::StringField, :label, 2
    optional ::Protobuf::Field::StringField, :license_plate, 3
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class EntitySelector
    optional ::Protobuf::Field::StringField, :agency_id, 1
    optional ::Protobuf::Field::StringField, :route_id, 2
    optional ::Protobuf::Field::Int32Field, :route_type, 3
    optional ::Transit_Realtime::TripDescriptor, :trip, 4
    optional ::Protobuf::Field::StringField, :stop_id, 5
    
    # Extension Fields
    extensions 1000...2000
  end
  
  class TranslatedString
    class Translation
      required ::Protobuf::Field::StringField, :text, 1
      optional ::Protobuf::Field::StringField, :language, 2
    end
    
    repeated ::Transit_Realtime::TranslatedString::Translation, :translation, 1
  end
  
  
end

