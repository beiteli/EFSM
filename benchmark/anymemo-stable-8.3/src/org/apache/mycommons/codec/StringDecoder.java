/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.mycommons.codec;

/**
 * Decodes a String into a String. 
 *
 * @author Apache Software Foundation
 * @version $Id: StringDecoder.java 634915 2008-03-08 09:30:25Z bayard $
 */
public interface StringDecoder extends Decoder {
    
    /**
     * Decodes a String and returns a String.
     * 
     * @param pString a String to encode
     * 
     * @return the encoded String
     * 
     * @throws DecoderException thrown if there is
     *  an error conidition during the Encoding process.
     */
    String decode(String pString) throws DecoderException;
}  

