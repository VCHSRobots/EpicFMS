// do_mapping() -- attempts to pair the emitters
// and collectors.  If error, returns false.
bool do_mapping() {
  for (int ichan =  0; ichan < 4; ichan++) {
    turn_off_all_emitters();
    // If all the emitters are off, then this simulates a detection, therefore
    // if any channel is not detecting, then something is wrong.
    for (int k = 0; k < 4; k++) {
      int reading = digitalRead(raw_detector_pins[k]);
      if (reading == LOW) {
        sprintf(lineout, "In do_mapping. Failed at raw_detector_pins. reading=%d, k=%d, raw_detector_pins[k] = %d", reading, k, raw_detector_pins[k]);
        Serial.println(lineout);  
        return false;
      }
    }
    // Good. Now turn the beam on for the channel we are working on, and
    // look for a "non-detection."  If we count more than one non-detection,
    // something is wrong.  Or if the pin that the non-detection is active,
    // and its already been used for a differnet channel, that is also an error.
    turn_on_emitter(ichan);
    int non_detect_count = 0;
    int index_of_non_detect = -1;
    for (int j = 0; j < 4; j++) {
      if (digitalRead(raw_detector_pins[j]) == LOW) {
        non_detect_count++;
        if (non_detect_count > 1) {
          // Too many detections for this channel.
          sprintf(lineout, "In do_mapping. Too many detections for one channel.  Chan=%d.", ichan); Serial.println(lineout);
          sprintf(lineout, "Reading j=%d index.  The index already taken = %d.", j, index_of_non_detect); 
          Serial.println(lineout);
          return false;  
        }
        index_of_non_detect = j;
        for (int k = 0; k < ichan - 1; k++) {
          if (emitter_indexes[k] == index_of_non_detect) return false;  // Emitter index already used.
        }  
        emitter_indexes[ichan] = index_of_non_detect;
      }
    }
  }
  return true;  // The emitter_indexes table should be filled up correctly.
}

// do_ring_check() -- fires the emitters one at a time and makes sure that their corresponding 
// detector sees the beam.  Returns false on error.
bool do_ring_check() {
  for (int ichan = 0; ichan < 4; ichan++) {
    turn_off_all_emitters();
    // Turn on one emitter, make sure it's detector sees the beam and none of the others do.
    turn_on_emitter(ichan);
    int nfound = 0;
    int index_found = -1;
    for (int k = 0; k < 4; k++) {
      if (digitalRead(raw_detector_pins[k]) == LOW) {
        nfound++;
        index_found = k;
      }
    }
    if (nfound != 1) {
      // Either nothing was found, or more than one detector was found. 
      // Bad either way.
      sprintf(lineout, "In ring_check. Expected to find one beam. Found=%d", nfound); 
      Serial.println(lineout);
      return false;
    }
    if (index_found != emitter_indexes[ichan]) {
      sprintf(lineout, "In ring_check. Index found doesn't match mapping. Index found = %d.", index_found);
      Serial.println(lineout);
      sprintf(lineout, "Working on channel = %d. Mapping = %d, %d, %d, %d.", ichan, 
        emitter_indexes[0], emitter_indexes[1], emitter_indexes[2], emitter_indexes[3]);
      Serial.println(lineout);
      // Wrong index found.  Something wrong.
      return false;
    } 
  }
  return true;
}

// do_self_check() -- Returns true if hardware seems okay.
bool do_self_check() {
  Serial.println("Starting Self Test.");
  bool okay = do_mapping();
  if (!okay) { 
    run_mode = RM_DANCE;
    Serial.println("Mapping failed.");
    return false;
  }
  sprintf(lineout, "Mapping Successful. Index are: %d, %d, %d, %d.",
    emitter_indexes[0], emitter_indexes[1], emitter_indexes[2], emitter_indexes[3]);
  Serial.println(lineout);
 
  okay = do_ring_check();
  if (!okay) {
    run_mode = RM_BLINK;
    Serial.println("Ring_check failed.");
    return false;
  }
  Serial.println("Ring_check successful.");
  Serial.println("Self Test complete: Hardware seems functional.");
  Serial.println("");
  run_mode = RM_NORMAL;
  return true;
}
