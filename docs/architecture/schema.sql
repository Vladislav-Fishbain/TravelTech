CREATE TYPE trip_status AS ENUM ('planning', 'active', 'completed', 'cancelled');
CREATE TYPE itinerary_type AS ENUM ('flight', 'hotel', 'activity');
CREATE TYPE item_status AS ENUM ('confirmed', 'delayed', 'cancelled', 'rescheduled');
CREATE TYPE opt_status AS ENUM ('pending', 'accepted', 'rejected');
CREATE TYPE member_role AS ENUM ('owner', 'editor', 'viewer');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(20),
    preferences JSONB,          
    visa_info JSONB,            
    baggage_default JSONB       
);

CREATE TABLE trips (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status trip_status DEFAULT 'planning',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE trip_members (
    id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES trips(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    role member_role DEFAULT 'viewer',
    UNIQUE(trip_id, user_id)
);

CREATE TABLE itinerary_items (
    id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES trips(id) ON DELETE CASCADE,
    type itinerary_type NOT NULL,
    external_ref_id VARCHAR(255), 
    title VARCHAR(255) NOT NULL,
    start_time TIMESTAMPTZ NOT NULL, 
    end_time TIMESTAMPTZ NOT NULL,   
    timezone VARCHAR(50) NOT NULL,   
    status item_status DEFAULT 'confirmed',
    metadata JSONB                  
);

CREATE TABLE passport_data (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    trip_id INT REFERENCES trips(id) ON DELETE CASCADE,
    encrypted_info TEXT NOT NULL,     
    expires_at TIMESTAMPTZ NOT NULL  
);

CREATE TABLE alternative_options (
    id SERIAL PRIMARY KEY,
    itinerary_item_id INT REFERENCES itinerary_items(id) ON DELETE CASCADE,
    type itinerary_type NOT NULL,
    details JSONB NOT NULL,          
    score NUMERIC(3,2),              
    status opt_status DEFAULT 'pending',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    trip_id INT REFERENCES trips(id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'queued',
    created_at TIMESTAMPTZ DEFAULT NOW()
);
