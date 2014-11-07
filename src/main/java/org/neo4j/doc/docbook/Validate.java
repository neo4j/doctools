/**
 * Copyright (c) 2002-2014 "Neo Technology,"
 * Network Engine for Objects in Lund AB [http://neotechnology.com]
 *
 * This file is part of Neo4j.
 *
 * Neo4j is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.neo4j.doc.docbook;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.SchemaFactory;

import org.etourdot.xincproc.xinclude.XIncProcConfiguration;
import org.etourdot.xincproc.xinclude.XIncProcEngine;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;

/**
 * Validate DocBook where the schema to use is the first parameter and the
 * document to validate the second. XIncludes will be resolved and included
 * before the validation.
 */
public class Validate
{
    public static void main( String[] args ) throws URISyntaxException, SAXException, ParserConfigurationException,
            IOException
    {
        final String schemaLocation = args[0];
        final String inputDocument = args[1];
        final StringBuffer out = new StringBuffer( 1024 );

        XIncProcEngine.getUnderlyingConfiguration().setConfigurationProperty(
                XIncProcConfiguration.ALLOW_FIXUP_BASE_URIS, false );

        ByteArrayOutputStream output = new ByteArrayOutputStream();

        XIncProcEngine.parse( new URI( inputDocument ), output );
        InputStream source = new ByteArrayInputStream( output.toString( "UTF-8" ).getBytes( StandardCharsets.UTF_8 ) );

        SchemaFactory schemaFactory = SchemaFactory.newInstance( "http://www.w3.org/2001/XMLSchema" );
        Source[] schemaSource = new Source[] { new StreamSource( schemaLocation ) };
        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setValidating( false );
        factory.setNamespaceAware( false );
        factory.setXIncludeAware( false );
        factory.setSchema( schemaFactory.newSchema( schemaSource ) );
        XMLReader reader = factory.newSAXParser().getXMLReader();
        ParserErrorHandler errorHandler = new ParserErrorHandler( out );
        reader.setErrorHandler( errorHandler );
        reader.parse( new InputSource( source ) );

        if ( errorHandler.hasFailed() )
        {
            throw new RuntimeException( "Validation errors were found in " + inputDocument + ".\n"
                                        + "See below for the validation information.\n" + out.toString() );
        }
        else if ( out.length() > 0 )
        {
            print( "Successfully validated " + inputDocument + "." );
            print( "There were however warnings, see below." );
            print( out.toString() );
        }
        else
        {
            print( "Successfully validated " + inputDocument );
        }
    }

    private static void print( String s )
    {
        System.out.println( s );
    }

    private static class ParserErrorHandler implements ErrorHandler
    {
        private boolean failFlag = false;
        private final StringBuffer output;

        public ParserErrorHandler( StringBuffer out )
        {
            this.output = out;
        }

        public void warning( SAXParseException e )
        {
            output.append( e.getMessage() ).append( '\n' );
        }

        public void error( SAXParseException e )
        {
            output.append( e.getMessage() ).append( '\n' );
            failFlag = true;
        }

        public void fatalError( SAXParseException e )
        {
            output.append( e.getMessage() ).append( '\n' );
            failFlag = true;
        }

        boolean hasFailed()
        {
            return failFlag;
        }
    }
}
